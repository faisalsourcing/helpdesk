#DevsQuest, https://devsquest.com/

module TranslationHelper
  def devsquest_translate(string, *args)
    Translation.translate(system_locale_via_uri&.locale, string, *args)
  end

  alias zt devsquest_translate
end
