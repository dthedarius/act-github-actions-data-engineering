ENV_FILE ?= env/local.env

test-ci-bump:
	@docker build -t localhost:5000/my-gh-actions-bump -f Dockerfile.bump .
	@docker push localhost:5000/my-gh-actions-bump
	@act pull_request -e test-workflow/bump-pr-event.json --env-file env/local.env --reuse
  
ca-config-poetry:
	DOMAIN_OWNER=$(aws sts get-caller-identity --query Account --output text)
			  REGION=${{ secrets.AWS_REGION }}

			  TOKEN=$(aws codeartifact get-authorization-token \
				--domain "$CODEARTIFACT_DOMAIN" \
				--domain-owner "$DOMAIN_OWNER" \
				--query authorizationToken --output text)

			  REPO_URL="https://${CODEARTIFACT_DOMAIN}-${DOMAIN_OWNER}.d.codeartifact.${REGION}.amazonaws.com/pypi/${CODEARTIFACT_REPO}/"

			  # Configure Poetry to use the private repo
			  poetry config repositories.private "$REPO_URL"
			  poetry config http-basic.private aws "$TOKEN"