#DevsQuest, https://devsquest.com/

class KnowledgeBase::Public::AnswersController < KnowledgeBase::Public::BaseController

  def show
    @category        = find_category(params[:category])
    @object          = find_answer(@category&.answers, params[:answer])
    @object_locales  = find_locales(@object)

    render_alternative if @object.blank?
  end

  private

  def render_alternative
    @alternative = find_answer @knowledge_base.answers.eager_load(translations: :kb_locale), params[:answer], locale: false

    raise ActiveRecord::RecordNotFound if !@alternative&.translations&.any?

    @object_locales = @alternative.translations.map(&:kb_locale).map(&:system_locale)

    render 'knowledge_base/public/show_alternatives', locals: { name: 'Answer' }
  end
end
