class PagesController < ApplicationController
  def lets_encrypt
    challenge = params[:id]

    if challenge == "Da_8Nqje3-if5YSUmQNGSa3aR2wbE1VpVdr-CcvY-E4"
      render text: "Da_8Nqje3-if5YSUmQNGSa3aR2wbE1VpVdr-CcvY-E4.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    elsif challenge == "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w"
      render text: "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    end
  end
end
