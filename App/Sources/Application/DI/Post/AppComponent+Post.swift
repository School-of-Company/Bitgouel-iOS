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
    
    var queryPostListUseCase: any QueryPostListUseCase {
        shared {
            QueryPostListUseCaseImpl(postRepository: postRepository)
        }
    }
    
    var queryPostDetailUseCase: any QueryPostDetailUseCase {
        shared {
            QueryPostDetailUseCaseImpl(postRepository: postRepository)
        }
    }
    
    var updatePostUseCase: UpdatePostUseCase {
        shared {
            UpdatePostUseCaseImpl(postRepository: postRepository)
        }
    }
    
    var deletePostUseCase: DeletePostUseCase {
        shared {
            DeletePostUseCaseImpl(postRepository: postRepository)
        }
    }
}
