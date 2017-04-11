module Web::Controllers::Home
  class Error
    include Web::Action

    def call(params)
      raise 'trouble'
    end
  end
end
