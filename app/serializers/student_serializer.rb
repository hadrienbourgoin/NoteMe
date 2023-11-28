class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :group_id
end
