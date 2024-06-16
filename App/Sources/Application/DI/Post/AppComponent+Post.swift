import NeedleFoundation
import Service

public extension AppComponent {
    var remotePostDataSource: any RemotePostDataSource {
        shared {
            RemotePostDataSourceImpl(keychain: keychain)
        }
    }

    var postRepository: any PostRepository {
        shared {
            PostRepositoryImpl(remotePostDataSource: remotePostDataSource)
        }
    }

    var writePostUseCase: any WritePostUseCase {
        shared {
            WritePostUseCaseImpl(postRepository: postRepository)
        }
    }

    var fetchPostListUseCase: any FetchPostListUseCase {
        shared {
            FetchPostListUseCaseImpl(postRepository: postRepository)
        }
    }

    var fetchPostDetailUseCase: any FetchPostDetailUseCase {
        shared {
            FetchPostDetailUseCaseImpl(postRepository: postRepository)
        }
    }

    var updatePostUseCase: any UpdatePostUseCase {
        shared {
            UpdatePostUseCaseImpl(postRepository: postRepository)
        }
    }

    var deletePostUseCase: any DeletePostUseCase {
        shared {
            DeletePostUseCaseImpl(postRepository: postRepository)
        }
    }
}
