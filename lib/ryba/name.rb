module Ryba
  class Name
    class <<self
      def gender
        male = Kernel.rand(100) < 50
        yield(male) if block_given?
        male
      end

      def first_name(male = nil)
        pick_with_gender(male, Ryba::Data::MaleNames, Ryba::Data::FemaleNames)
      end
      
      def middle_name(male = nil)
        pick_with_gender(male, Ryba::Data::MaleMiddleNames, Ryba::Data::FemaleMiddleNames)
      end

      def family_name(male = nil)
        male = gender if male.nil?

        famname = Ryba.pick(Ryba::Data::FamilyNames)

        if famname.is_a? Array
          famname[0] + famname[male ? 1 : 2]
        else
          male ? famname : famname + 'а'
        end
      end

      private

      def pick_with_gender(male, male_ary, female_ary)
        male = gender if male.nil?
        Ryba.pick(male ? male_ary : female_ary)
      end
    end
  end
end
