#line 1 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"




#include <logos/logos.h>
#include <substrate.h>
@class Post; @class RedditAPI; 
static int (*_logos_orig$_ungrouped$Post$isInVisitedList)(Post*, SEL); static int _logos_method$_ungrouped$Post$isInVisitedList(Post*, SEL); static void (*_logos_orig$_ungrouped$Post$markVisited)(Post*, SEL); static void _logos_method$_ungrouped$Post$markVisited(Post*, SEL); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$RedditAPI(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("RedditAPI"); } return _klass; }
#line 5 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"



static int _logos_method$_ungrouped$Post$isInVisitedList(Post* self, SEL _cmd) {
    if( [self visited] || [[[self rawDictionary] objectForKey:@"visited"] boolValue] ) return 1;
	else return 0;
}


static void _logos_method$_ungrouped$Post$markVisited(Post* self, SEL _cmd) {
    NSString *url = [@"https://oauth.reddit.com/api/store_visits?links=" stringByAppendingString:[self name]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    
    NSDictionary<NSString *, NSString *> *headers = [[_logos_static_class_lookup$RedditAPI() shared] generateOAuthAuthenticationHeadersForRedditRequest];
    for(NSString *key in headers)
    {
        [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
    _logos_orig$_ungrouped$Post$markVisited(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$Post = objc_getClass("Post"); MSHookMessageEx(_logos_class$_ungrouped$Post, @selector(isInVisitedList), (IMP)&_logos_method$_ungrouped$Post$isInVisitedList, (IMP*)&_logos_orig$_ungrouped$Post$isInVisitedList);MSHookMessageEx(_logos_class$_ungrouped$Post, @selector(markVisited), (IMP)&_logos_method$_ungrouped$Post$markVisited, (IMP*)&_logos_orig$_ungrouped$Post$markVisited);} }
#line 32 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"
