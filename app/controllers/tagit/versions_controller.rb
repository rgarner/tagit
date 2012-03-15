module Tagit

  class VersionsController < ActionController::Base
    respond_to :html, :text
    def current
      @version = Tagit::Version.current
      respond_with(@version) do |format|
        format.html { render  }
        format.text { render :text => @version.to_s }
      end
    end
  end
end