test-ci-bump:
  docker build -t localhost:50000/my-gh-actions-bump -f Dockerfile.bump
  docker push localhost:50000/my-gh-actions-bump
  act pull_request -e test-workflow/bump-pr-event.json
  
