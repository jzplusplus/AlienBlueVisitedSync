
// Logos by Dustin Howett
// See http://iphonedevwiki.net/index.php/Logos

%hook Post

- (int)isInVisitedList
{
    if( [self visited] || [[[self rawDictionary] objectForKey:@"visited"] boolValue] ) return 1;
	else return 0;
}

- (void)markVisited
{
    NSString *url = [@"https://oauth.reddit.com/api/store_visits?links=" stringByAppendingString:[self name]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    request.HTTPMethod = @"POST";
    
    NSDictionary<NSString *, NSString *> *headers = [[%c(RedditAPI) shared] generateOAuthAuthenticationHeadersForRedditRequest];
    for(NSString *key in headers)
    {
        [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }
    
    [[NSURLConnection alloc] initWithRequest:request delegate:nil];
    
    %orig;
}

%end
