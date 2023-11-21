//
//  ScanViewController.h
//
//  (c) Veryfi.com
//

#import <UIKit/UIKit.h>

@interface ScanViewController : UIViewController <UINavigationControllerDelegate>

/**
 * Constructor with credentials.
 * Your account manager should have provided the Client ID to you prior to dev.
 * @author Veryfi
 *
 * @param clientId Unique and assigned to each app.
 * @param username Veryfi username assigned to each Veryfi auth account. Use Veryfi API to register account.
 * @param apiKey Veryfi apiKey assigned to each Veryfi auth account. Use Veryfi API to register account.
 * @return Self (n/a)
 */
- (id)initWithClientId:(NSString *)clientId
           andUsername:(NSString *)username
             andAPIKey:(NSString *)apiKey;

- (void)passInClientId:(NSString *)clientId
           andUsername:(NSString *)username
             andAPIKey:(NSString *)apiKey;

// OPTIONAL
@property NSString *categoryName;
@property NSString *tagName;
@property NSString *googlePlacesKey;

@end
