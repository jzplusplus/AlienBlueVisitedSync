#line 1 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"




#include <logos/logos.h>
#include <substrate.h>
@class RedditAPI; @class Post; 
static int (*_logos_orig$_ungrouped$Post$isInVisitedList)(Post*, SEL); static int _logos_method$_ungrouped$Post$isInVisitedList(Post*, SEL); static void (*_logos_orig$_ungrouped$Post$markVisited)(Post*, SEL); static void _logos_method$_ungrouped$Post$markVisited(Post*, SEL); 
static __inline__ __attribute__((always_inline)) Class _logos_static_class_lookup$RedditAPI(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("RedditAPI"); } return _klass; }
#line 5 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"



static int _logos_method$_ungrouped$Post$isInVisitedList(Post* self, SEL _cmd) {
    if( [self visited] || [[[self rawDictionary] objectForKey:@"visited"] boolValue] ) return 1;
	else return 0;
}


static void _logos_method$_ungrouped$Post$markVisited(Post* self, SEL _cmd) {
    NSString *url = [@"http://www.reddit.com/api/store_visits?links=" stringByAppendingString:[self name]];
    NSString *modhash = [[_logos_static_class_lookup$RedditAPI() shared] modhash];
    NSString *cookie = [@"reddit_session=" stringByAppendingString:[[_logos_static_class_lookup$RedditAPI() shared] cookie]];
    



    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    
    [request addValue:cookie forHTTPHeaderField:@"Cookie"];
    [request addValue:modhash forHTTPHeaderField:@"X-Modhash"];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
    _logos_orig$_ungrouped$Post$markVisited(self, _cmd);
}


static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$Post = objc_getClass("Post"); MSHookMessageEx(_logos_class$_ungrouped$Post, @selector(isInVisitedList), (IMP)&_logos_method$_ungrouped$Post$isInVisitedList, (IMP*)&_logos_orig$_ungrouped$Post$isInVisitedList);MSHookMessageEx(_logos_class$_ungrouped$Post, @selector(markVisited), (IMP)&_logos_method$_ungrouped$Post$markVisited, (IMP*)&_logos_orig$_ungrouped$Post$markVisited);} }
#line 35 "/Users/jzplusplus/Documents/jailbreak/AlienBlueVisitedSync/AlienBlueVisitedSync/AlienBlueVisitedSync.xm"
