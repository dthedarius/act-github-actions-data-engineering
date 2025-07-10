ENV_FILE ?= env/local.env

test-ci-bump:
	@docker build -t localhost:5000/my-gh-actions-bump -f Dockerfile.bump .
	@docker push localhost:5000/my-gh-actions-bump
	@act pull_request -e test-workflow/bump-pr-event.json --env-file env/local.env --reuse
  
