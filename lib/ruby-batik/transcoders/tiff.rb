module Batik
  module Transcoders
    import org.apache.batik.transcoder.image.TIFFTranscoder
    class TIFF < Abstract
      def self.klass; TIFFTranscoder; end
      
      # Available options:
      #   force_transparent_white(Boolean) => false
      #   compression_method(String) => "none"
      def self.default_options
        super
      end
    end
  end
end