module Pipedrive
  class Person < Base

    class << self
      
      def filter_all(filter_id, opts = {:start => 0, :sort_mode => 'asc'})
        Person.all( get("/persons", :query => opts.merge(:filter_id => filter_id) ) )
      end
      
      def find_or_create_by_name(name, opts={})
        find_by_name(name, :org_id => opts[:org_id]).first || create(opts.merge(:name => name))
      end

    end

    def deals()
      Deal.all(get "#{resource_path}/#{id}/deals", :everyone => 1)
    end
    
  
  end
end