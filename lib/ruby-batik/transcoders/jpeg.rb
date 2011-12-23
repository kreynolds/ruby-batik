module Batik
  module Transcoders
    import org.apache.batik.transcoder.image.JPEGTranscoder
    class JPEG < Abstract
      def self.klass; JPEGTranscoder; end

      def self.java_types
        super.merge({:quality => Float})
      end
      
      def self.default_options
        super.merge({:quality => 0.8})
      end
    end
  end
end