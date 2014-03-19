ThinkingSphinx::Index.define :post, with: :active_record do
  # fields
  indexes name, sortable: true
  indexes body

  # attributes
  has created_at, updated_at
end
