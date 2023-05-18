import git
import os


def get_remote_tags(repo):
    tagList=repo.git.ls_remote("--tags", "origin")
    tags = tagList.split('\n')[0].split('/')
    return tags

def get_local_tags(repo):
    return repo.tags


def __main__():
    cwd = os.getcwd()
    repo = git.Repo(cwd)
    print(get_remote_tags(repo))
    print(get_local_tags(repo))