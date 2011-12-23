module Batik
  module Transcoders
    import org.apache.batik.transcoder.TranscodingHints
    import org.apache.batik.transcoder.TranscoderInput
    import org.apache.batik.transcoder.TranscoderOutput
    class Abstract
      def self.java_types
        {
          :snapshot_time => Float,
          :pixel_unit_to_millimeter => Float,
          :max_height => Float,
          :max_width => Float,
          :height => Float,
          :width => Float,
        }
      end
      
      def self.default_options
        {
          :execute_onload => true, # true/false
          :allowed_script_types => nil, # text/ecmascript, application/java-archive
          :constrain_script_origin => nil, # true/false
          :snapshot_time => nil,
          :pixel_unit_to_millimeter => 0.264583, # Size of a px in millimeters
          :user_stylesheet_uri => nil,
          :alternate_stylesheet => nil,
          :default_font_family => nil,
          :media => nil,
          :language => nil,
          :max_height => nil,
          :max_width => nil,
          :height => nil,
          :width => nil,
        }
      end
      
      def self.transcode(document, options={})
        options = default_options.merge(process_options(options.dup))
        in_io = StringIO.new(document)
        out_io = StringIO.new('','w+b')

        transcoder = klass.new
        options.each_pair do |key, val|
          next if val.nil?

          java_type = java_type_for(key)
          transcoder.java_send(:addTranscodingHint,
                               [TranscodingHints::Key, java.lang.Object],
                               transcoder.class.const_get("key_#{key}".upcase), 
                               val.to_java(java_type))
        end
        input = TranscoderInput.java_class.constructor(java.io.InputStream).new_instance(in_io.to_inputstream)
        output = TranscoderOutput.java_class.constructor(java.io.OutputStream).new_instance(out_io.to_outputstream)

        transcoder.transcode(input, output)
        out_io.flush
        out_io.rewind
        out_io.read
      end

      private
      
      def self.process_options(options)
        if dpi = options.delete(:dpi)
          options[:pixel_unit_to_millimeter] = 25.4 / dpi
        end

        options
      end
      
      def self.java_type_for(key)
        java_types[key] ? eval("java.lang.#{java_types[key]}") : nil
      end
    end
  end
end
