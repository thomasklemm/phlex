# frozen_string_literal: true

module Views
	module Comments
		class Comment < ApplicationView
			def initialize(name:, body:)
				@name = name
				@body = body
			end

			def template(&)
				div {
					span { @name }
					span { @body }

					yield_content(&)

					render(::ReactionComponent.new(emoji: "hamburger")) do
						p { "Emoji reaction for a comment from #{@name} with body #{@body}" }
					end
				}
			end
		end
	end
end
