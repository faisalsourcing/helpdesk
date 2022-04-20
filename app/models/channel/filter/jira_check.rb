#DevsQuest, https://devsquest.com/

class Channel::Filter::JiraCheck < Channel::Filter::BaseExternalCheck
  MAIL_HEADER        = 'x-jira-fingerprint'.freeze
  SOURCE_ID_REGEX    = %r{\[JIRA\]\s\((\w+-\d+)\)}
  SOURCE_NAME_PREFIX = 'Jira'.freeze
end
