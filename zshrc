zstyle :compinstall filename '/home/andy/.zshrc'

autoload -Uz compinit
compinit

eval "$(starship init zsh)"
starship config command_timeout 1000

if test -d $HOME/.aws; then
    function aws-export-dev-creds() {
        profile="dev"
        echo "Exporting $profile creds..."
        creds=$(aws configure export-credentials --profile $profile)
        aws configure set aws_access_key_id $(echo $creds | jq -r .AccessKeyId)
        aws configure set aws_secret_access_key $(echo $creds | jq -r .SecretAccessKey)
        aws configure set aws_session_token $(echo $creds | jq -r .SessionToken)
    }
    alias sso_login='aws sso login --profile dev && aws-export-dev-creds'
fi