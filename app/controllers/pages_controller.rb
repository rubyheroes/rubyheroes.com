class PagesController < ApplicationController
  def lets_encrypt
    challenge = params[:id]

    if challenge == "lSftdPLTXtCIPVMrk77tz0hAdqYZ0y4IVWXfJ6KfLPc"
      render text: "lSftdPLTXtCIPVMrk77tz0hAdqYZ0y4IVWXfJ6KfLPc.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    elsif challenge == "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w"
      render text: "m8t_Qv3hlIdussgiQdV3C6GyvkrfMwgXNMbhdVnkj9w.CRFFg2ylHX-dAS-TAtyvUkUwQ1tYenjudYtSmwAXA2U"
    end
  end
end
