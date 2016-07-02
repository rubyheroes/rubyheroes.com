class PagesController < ApplicationController
  def lets_encrypt
    challenge = params[:id]

    if challenge == "Mc-emxHWYa_wjabUPkcmXdLOaEeAvZA6bRgUmG1DkGg"
      render text: "Mc-emxHWYa_wjabUPkcmXdLOaEeAvZA6bRgUmG1DkGg.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    elsif challenge == "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w"
      render text: "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    end
  end
end
