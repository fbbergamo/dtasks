class Task < ActiveRecord::Base
	belongs_to :list
	validates_presence_of :list, :text
	has_ancestry orphan_strategy:  :destroy
	validate :parent_same_list
	delegate :user, to: :list
	scope :by_user,  -> (user, id) {
		joins(list: :user ).where(lists: {user_id: user.id}).find(id)
	}
	def parent_same_list
		node = self.parent
		errors.add(:ancestry, "should be in the same list") if node and node.list != self.list
	end

	def nodes_to_remove
		nodes = [self]
		node = self
		while node.is_only_child? do
			node = node.parent
			node ? (nodes << node) : break
		end
		nodes
	end

	def destroy_recusive
		nodes = self.nodes_to_remove
		nodes.each do |node|
			node.destroy
		end
		nodes
	end


end
