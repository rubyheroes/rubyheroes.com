class PagesController < ApplicationController
  def lets_encrypt
    challenge = params[:id]

    if challenge == "fSK3rze7XEjZ61BbT_kVRqCbrHUvQljxdsUEUklCW0A"
      render text: "fSK3rze7XEjZ61BbT_kVRqCbrHUvQljxdsUEUklCW0A.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    end
  end
end
