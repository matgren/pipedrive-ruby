module Pipedrive

  class Organization < Base

    def self.create( opts = {} )
      res = post "/organizations", :body => opts
      if res.success?
        res['data'] = opts.merge res['data']
        Organization.new(res)
      else
        bad_response(res)
      end
    end

    def self.find(id)
      res = get "/organizations/#{id}"
      if res.ok?
        Organization.new(res)
      else
        bad_response(res)
      end
    end

    def self.find_by_name(name)
      res = get "/organizations/find?term=#{name}"
      if res.ok?
        Organization.new(res)
      else
        bad_response(res)
      end
    end

  end

end