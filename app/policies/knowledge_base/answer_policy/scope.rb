#DevsQuest, https://devsquest.com/

class KnowledgeBase::AnswerPolicy < ApplicationPolicy
  class Scope < ApplicationPolicy::Scope
    def resolve
      if user&.permissions?('knowledge_base.editor')
        scope
      else
        scope.published
      end
    end

    private

    def user_required?
      false
    end
  end
end
