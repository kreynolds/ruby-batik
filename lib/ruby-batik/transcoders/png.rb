module Batik
  module Transcoders
    import org.apache.batik.transcoder.image.PNGTranscoder
    class PNG < Abstract
      def self.klass; PNGTranscoder; end
      
      def self.java_types
        super.merge({:gamma => Float})
      end

      # Available options:
      #   indexed(Integer) => nil
      #     8,4,2,1
      #   gamma(Float) => nil
      #     
      def self.default_options
        super
      end
    end
  end
end