java_import 'org.apache.batik.transcoder.ErrorHandler'

module Batik
  class Transcoder
    def initialize(options={})
      @options = options
    end

    def to_png(document, args={})
      Transcoders::PNG.transcode(document, @options.merge(args))
    end

    def to_jpeg(document, args={})
      Transcoders::JPEG.transcode(document, @options.merge(args))
    end
    alias_method :to_jpg, :to_jpeg

    def to_tiff(document, args={})
      Transcoders::TIFF.transcode(document, @options.merge(args))
    end
    alias_method :to_tif, :to_tiff
  end

  class DefaultErrorHandler
    include Java::OrgApacheBatikTranscoder::ErrorHandler

 	  def error(exception)
   		raise exception
  	end

  	def fatalError(exception)
   		raise exception
  	end

  	def warning(exception)
      raise exception
  	end
  end
end