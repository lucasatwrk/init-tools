#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -xe

# git
git config --global user.name "lucasatwrk"
git config --global user.email "112657074+lucasatwrk@users.noreply.github.com"
git config --global core.editor "vim"

# cache git credential for 1 week
git config --global credential.helper "cache --timeout=604800"

# git pretty log
git config --global alias.lg "lg1"
git config --global alias.lg1 "lg1-specific --all"
git config --global alias.lg2 "lg2-specific --all"
git config --global alias.lg3 "lg3-specific --all"
git config --global alias.lg1-specific "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
git config --global alias.lg2-specific "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'"
git config --global alias.lg3-specific "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"

# github CLI
curl -sLo gh.tar.gz https://github.com/cli/cli/releases/download/v2.14.4/gh_2.14.4_linux_amd64.tar.gz \
    && tar -zxvf gh.tar.gz gh_2.14.4_linux_amd64/bin/gh \
    --strip-components 2 && sudo mv ./gh /usr/local/bin \
    && rm gh.tar.gz

# jq
curl -sLo ./jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 \
    && chmod +x ./jq \
    && sudo mv ./jq /usr/local/bin

# yq
curl -sLo ./yq.tar.gz https://github.com/mikefarah/yq/releases/download/v4.27.2/yq_linux_amd64.tar.gz \
    && tar -zxf yq.tar.gz ./yq_linux_amd64 \
    && sudo mv yq_linux_amd64 /usr/local/bin/yq \
    && rm -f yq.tar.gz

# kubectl
curl -sLO https://dl.k8s.io/release/v1.24.0/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && sudo mv ./kubectl /usr/local/bin/

# kind
curl -sLo ./kind https://kind.sigs.k8s.io/dl/v0.14.0/kind-linux-amd64 \
    && chmod +x ./kind \
    && sudo mv ./kind /usr/local/bin/kind

# helm 
curl -sLo ./helm.tar.gz https://get.helm.sh/helm-v3.9.3-linux-amd64.tar.gz \
    && tar -zxvf helm.tar.gz linux-amd64/helm \
    --strip-components 1 && sudo mv ./helm /usr/local/bin/ \
    && rm ./helm.tar.gz

# k9s
curl https://github.com/derailed/k9s/releases/download/v0.27.3/k9s_Linux_amd64.tar.gz -L | tar xzv k9s \
    && sudo mv ./k9s /usr/local/bin

# kubefwd
curl -sLo ./kubefwd_amd64.deb https://github.com/txn2/kubefwd/releases/download/1.22.4/kubefwd_amd64.deb \
    && sudo dpkg -i kubefwd_amd64.deb \
    && rm kubefwd_amd64.deb

# login github
gh auth login -p https -h github.com -w
