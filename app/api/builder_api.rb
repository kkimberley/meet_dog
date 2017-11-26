class BuilderApi < Grape::API

    version 'v1', using: :path
    format :json

    mount PostApi
end