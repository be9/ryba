module Ryba
  class Company
    class <<self
      def name(opts = {})
        ind = opts[:industries] || opts[:industry] || 3
        industries = case ind
                     when Numeric
                       Ryba.pick_multi(Data::Industries, ind)
                     when Array
                       ind
                     when Symbol
                       [ ind ]
                     else
                       raise ArgumentError
                     end

        words = (industries << :common).map { |i| Data::CompanyNameParts[i] }.flatten

        last_word_variants = words.select { |w| !w.start_with?('-') }
        inner_word_variants = words.select { |w| !w.start_with?('$') }

        word_count = (opts[:solidity] || 1) + 1

        last_word = Ryba.pick(last_word_variants)

        parts = Ryba.pick_multi(inner_word_variants - [last_word], word_count - 1)
        name = (parts << last_word).map { |w| w.sub(/^[-$]/, '') } * ''

        if rand(5) > 2
          suffix = Ryba.pick(Data::CompanyNameSuffixes)

          if suffix.start_with?('-')
            name << suffix
          else
            name = "#{name} #{suffix}"
          end
        end

        name
      end
    end
  end
end
