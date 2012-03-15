module Tagit

  class VersionsController < ActionController::Base
    respond_to :html, :text, :json

    def current
      @version = Tagit::Version.current
      respond_with(@version) do |format|
        format.text { render :text => @version.to_s }
      end
    end

    def index
      respond_with(@versions = Tagit::Version.all)
    end
  end

end