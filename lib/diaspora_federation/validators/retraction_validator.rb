# frozen_string_literal: true

module DiasporaFederation
  module Validators
    # This validates a {Entities::Retraction}.
    class RetractionValidator < OptionalAwareValidator
      include Validation

      rule :author, :diaspora_id

      rule :target_guid, :guid
      rule :target_type, :not_empty
      rule :target, :not_nil
    end
  end
end
