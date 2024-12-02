.PHONY: verify
verify:
	mix compile --all-warnings && \
	mix format --check-formatted && \
	mix credo
