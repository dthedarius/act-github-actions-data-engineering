init-docker:
	docker run -d -p 5000:5000 --name registry registry:2


test-ci-bump:
	@docker build -t localhost:5000/my-gh-actions-bump -f Dockerfile.bump .
	@docker push localhost:5000/my-gh-actions-bump
	@act pull_request -e test-workflow/bump-pr-event.json --env-file env/local.env --reuse
  
