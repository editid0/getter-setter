class CodeItem < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :value, presence: true
    validates :access_token, presence: true, uniqueness: true
    validates :delete_token, presence: true, uniqueness: true
	
    def requires_read_token?
		require_access_read
    end

    def requires_write_token?
		require_access_write
    end

    def can_read?(token = nil)
		!requires_read_token? || access_token == token
    end

    def can_write?(token = nil)
		!requires_write_token? || access_token == token
    end

    def can_delete?(token = nil)
		delete_token == token
    end
end
