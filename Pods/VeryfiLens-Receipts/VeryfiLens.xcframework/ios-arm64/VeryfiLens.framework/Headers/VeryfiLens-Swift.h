// Generated by Apple Swift version 5.6.1 (swiftlang-5.6.0.323.66 clang-1316.0.20.12)
#ifndef VERYFILENS_SWIFT_H
#define VERYFILENS_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if !defined(SWIFT_EXTERN)
# if defined(__cplusplus)
#  define SWIFT_EXTERN extern "C"
# else
#  define SWIFT_EXTERN extern
# endif
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import Foundation;
@import ObjectiveC;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="VeryfiLens",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif


@protocol CollectUpfrontPopupViewControllerDelegate;
@class VeryfiLensCategory;
@class VeryfiLensCostCode;
@class VeryfiLensCPModel;
@class VeryfiLensTag;
@class NSString;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC10VeryfiLens33CollectUpfrontPopupViewController")
@interface CollectUpfrontPopupViewController : UIViewController
@property (nonatomic) BOOL isHidden;
@property (nonatomic) BOOL isCategoryEnabled;
@property (nonatomic) BOOL isTagEnabled;
@property (nonatomic) BOOL isCustomerEnabled;
@property (nonatomic) BOOL isCostCodeEnabled;
@property (nonatomic) BOOL isNotesEnabled;
- (void)hide;
@property (nonatomic, strong) id <CollectUpfrontPopupViewControllerDelegate> _Nullable delegate;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)initializeWithPresetValuesWithCategory:(VeryfiLensCategory * _Nullable)category costCode:(VeryfiLensCostCode * _Nullable)costCode fusedCP:(VeryfiLensCPModel * _Nullable)fusedCP tag:(VeryfiLensTag * _Nullable)tag note:(NSString * _Nullable)note;
- (void)show;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_PROTOCOL("_TtP10VeryfiLens41CollectUpfrontPopupViewControllerDelegate_")
@protocol CollectUpfrontPopupViewControllerDelegate
- (void)updateCategoryName:(VeryfiLensCategory * _Nullable)category;
- (void)updateTagName:(VeryfiLensTag * _Nullable)tag;
- (void)updateCustomerProjectName:(VeryfiLensCPModel * _Nullable)customer;
- (void)updateCostCodeName:(VeryfiLensCostCode * _Nullable)costCode;
- (void)updateNotes:(NSString * _Nullable)notes;
- (void)didSubmit;
- (void)closeUpfront;
- (VeryfiLensCategory * _Nullable)getCategory SWIFT_WARN_UNUSED_RESULT;
- (VeryfiLensTag * _Nullable)getTag SWIFT_WARN_UNUSED_RESULT;
- (VeryfiLensCPModel * _Nullable)getCustomer SWIFT_WARN_UNUSED_RESULT;
- (VeryfiLensCostCode * _Nullable)getCostCode SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)getNotes SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_PROTOCOL_NAMED("Credentials")
@protocol Credentials <NSObject>
@property (nonatomic, readonly, copy) NSString * _Nonnull clientId;
@property (nonatomic, readonly, copy) NSString * _Nonnull username;
@property (nonatomic, readonly, copy) NSString * _Nonnull apiKey;
@property (nonatomic, readonly, copy) NSString * _Nonnull url;
- (nonnull instancetype)initWithClientId:(NSString * _Nonnull)clientId username:(NSString * _Nonnull)username apiKey:(NSString * _Nonnull)apiKey url:(NSString * _Nonnull)url;
@end

typedef SWIFT_ENUM(NSInteger, CustomerOrProject, open) {
  CustomerOrProjectCustomer = 0,
  CustomerOrProjectProject = 1,
};

typedef SWIFT_ENUM_NAMED(NSInteger, DataExtractionEngine, "DataExtractionEngine", open) {
  DataExtractionEngineCloudAPI = 0,
  DataExtractionEngineInApp = 1,
  DataExtractionEngineNone = 2,
};


SWIFT_CLASS("_TtC10VeryfiLens19PopupViewController")
@interface PopupViewController : UIViewController
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;
@end

@protocol MenuViewControllerDelegate;

SWIFT_CLASS("_TtC10VeryfiLens18MenuViewController")
@interface MenuViewController : PopupViewController
@property (nonatomic, copy) NSString * _Nonnull emailText;
@property (nonatomic) BOOL enableEmail;
@property (nonatomic) BOOL enableVoice;
@property (nonatomic) BOOL enableGallery;
@property (nonatomic) BOOL enableBrowse;
@property (nonatomic) BOOL enableSettings;
@property (nonatomic) BOOL enableShield;
@property (nonatomic, weak) id <MenuViewControllerDelegate> _Nullable menuDelegate;
- (void)viewDidLoad;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_PROTOCOL("_TtP10VeryfiLens26MenuViewControllerDelegate_")
@protocol MenuViewControllerDelegate <NSObject>
- (void)menuViewShowEmail;
- (void)menuViewShowVoice;
- (void)menuViewShowGallery;
- (void)menuViewShowBrowse;
- (void)menuViewShowSettings;
- (void)menuViewShowShield;
- (void)menuViewDidUpdateUserSettings;
@end



SWIFT_PROTOCOL("_TtP10VeryfiLens9Reachable_")
@protocol Reachable <NSObject>
@property (nonatomic, copy) void (^ _Nullable reachableBlock)(void);
@property (nonatomic, copy) void (^ _Nullable unreachableBlock)(void);
@property (nonatomic, readonly) BOOL isReachable;
@property (nonatomic, readonly) BOOL isReachableViaWWAN;
@property (nonatomic, readonly) BOOL isReachableViaWiFi;
@end



@class UIColor;

@interface UIView (SWIFT_EXTENSION(VeryfiLens))
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic, strong) IBInspectable UIColor * _Nullable borderColor;
@end


@class VeryfiLensCredentials;
@class VeryfiLensSettings;
@class VeryfiLensUtils;
@protocol VeryfiLensDelegate;
@class UIImage;
@class NSURL;

/// When using the Lens SDK, you have the option of using the provided UI that has been designed, tested and proven by Veryfi, or you can opt to use your own custom UI and utilize the utils library for document detection and cropping, image corrections and communicating with the Veryfi API.
/// @author Veryfi
/// @property credentials provides an access to Lens.
/// @property utils provides the image processing and data extraction functionality available in Lens SDK that can be used in your custom UI.
/// @property settings configures Lens.
/// @property delegate communicates with Lens
SWIFT_CLASS("_TtC10VeryfiLens10VeryfiLens")
@interface VeryfiLens : NSObject
+ (VeryfiLens * _Nonnull)shared SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, strong) VeryfiLensCredentials * _Nonnull credentials;
@property (nonatomic, readonly, strong) VeryfiLensSettings * _Nonnull settings;
@property (nonatomic, readonly, strong) VeryfiLensUtils * _Nonnull utils;
@property (nonatomic, weak) id <VeryfiLensDelegate> _Nullable delegate;
/// Configures Lens before  use
/// Your account manager should have provided the credentials to you prior to dev.
/// @author Veryfi
- (void)configureWith:(VeryfiLensCredentials * _Nonnull)credentials settings:(VeryfiLensSettings * _Nonnull)settings completion:(void (^ _Nullable)(BOOL))completion;
/// Starts the custom Camera to extract data from image
/// @author Veryfi
- (void)showCameraIn:(UIViewController * _Nonnull)viewController;
/// Starts the Gallery Screen to upload images from gallery, not using camera technology
/// @author Veryfi
- (void)showGalleryIn:(UIViewController * _Nonnull)viewController;
/// Starts the Documents Browser Screen to upload documents, not using camera technology
/// @author Veryfi
- (void)showDocumentBrowserIn:(UIViewController * _Nonnull)viewController;
/// Starts the via Voice Screen to extract data from recorded voice audio or text
/// @author Veryfi
- (void)showVoiceIn:(UIViewController * _Nonnull)viewController;
/// Starts the Email Screen to show the @veryfi.cc (or whitelabelled domain) email
/// @author Veryfi
- (void)showEmailIn:(UIViewController * _Nonnull)viewController;
/// Starts the Manual Crop Screen that crops the image to fit the drawn area.
/// @author Veryfi
- (void)showCropIn:(UIViewController * _Nonnull)viewController image:(UIImage * _Nonnull)image completion:(void (^ _Nullable)(UIImage * _Nullable))completion;
/// Uploads up to 4 images without UI. If there are more then 4 images passed in the function, first 4 ar used
/// @author Veryfi
- (void)headlessUploadWithImages:(NSArray<UIImage *> * _Nonnull)images;
/// Uploads a document without UI.
/// @author Veryfi
- (void)headlessUploadWithUrl:(NSURL * _Nonnull)url;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end

@class NSNumber;

SWIFT_CLASS_NAMED("VeryfiLensCPModel")
@interface VeryfiLensCPModel : NSObject <NSSecureCoding>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
@property (nonatomic) enum CustomerOrProject primaryCP;
@property (nonatomic, strong) NSNumber * _Nonnull customerId;
@property (nonatomic, copy) NSString * _Nonnull customerName;
@property (nonatomic, strong) NSNumber * _Nullable projectId;
@property (nonatomic, copy) NSString * _Nullable projectName;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * _Nonnull)dictionary OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (NSString * _Nonnull)fusedId SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)displayName SWIFT_WARN_UNUSED_RESULT;
@end

@class VeryfiLensCurrency;

SWIFT_CLASS_NAMED("VeryfiLensCategory")
@interface VeryfiLensCategory : NSObject <NSSecureCoding>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
@property (nonatomic, strong) NSNumber * _Nonnull categoryId;
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic) double monthlyBudget;
@property (nonatomic, strong) VeryfiLensCurrency * _Nonnull currency;
@property (nonatomic) double spent;
@property (nonatomic) NSInteger receiptsCount;
@property (nonatomic, copy) NSString * _Nonnull type;
@property (nonatomic, copy) NSString * _Nonnull mimo;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * _Nonnull)dictionary OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (NSString * _Nonnull)getFormattedTotalWithCurrency SWIFT_WARN_UNUSED_RESULT;
+ (NSString * _Nonnull)getTypeNameFromTypeKey:(NSString * _Nonnull)typeKey SWIFT_WARN_UNUSED_RESULT;
+ (NSDictionary<NSString *, NSString *> * _Nonnull)types SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS_NAMED("VeryfiLensCostCode")
@interface VeryfiLensCostCode : NSObject <NSSecureCoding>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
@property (nonatomic, strong) NSNumber * _Nonnull costCodeId;
@property (nonatomic, copy) NSString * _Nonnull code;
@property (nonatomic, copy) NSString * _Nonnull desc;
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic, copy) NSString * _Nonnull type;
@property (nonatomic, readonly) BOOL hasCostCode;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCostCodeId:(NSNumber * _Nonnull)costCodeId code:(NSString * _Nonnull)code desc:(NSString * _Nonnull)desc name:(NSString * _Nonnull)name type:(NSString * _Nonnull)type OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWith:(NSDictionary * _Nullable)dictionary OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS_NAMED("VeryfiLensCredentials")
@interface VeryfiLensCredentials : NSObject <Credentials>
@property (nonatomic, readonly, copy) NSString * _Nonnull clientId;
@property (nonatomic, readonly, copy) NSString * _Nonnull username;
@property (nonatomic, readonly, copy) NSString * _Nonnull apiKey;
@property (nonatomic, readonly, copy) NSString * _Nonnull url;
- (nonnull instancetype)initWithClientId:(NSString * _Nonnull)clientId username:(NSString * _Nonnull)username apiKey:(NSString * _Nonnull)apiKey url:(NSString * _Nonnull)url OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWith:(NSDictionary<NSString *, id> * _Nonnull)dictionary OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end



SWIFT_CLASS_NAMED("VeryfiLensCurrency")
@interface VeryfiLensCurrency : NSObject <NSSecureCoding>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
@property (nonatomic, copy) NSString * _Nonnull code;
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic, copy) NSString * _Nonnull symbol;
@property (nonatomic) BOOL isRecent;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * _Nullable)dictionary OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
+ (NSDictionary<NSString *, id> * _Nonnull)getDeviceCurrencyInfo SWIFT_WARN_UNUSED_RESULT;
- (NSDictionary<NSString *, id> * _Nonnull)asDict SWIFT_WARN_UNUSED_RESULT;
@end


/// Communicating with Lens
/// @author Veryfi
SWIFT_PROTOCOL_NAMED("VeryfiLensDelegate")
@protocol VeryfiLensDelegate
/// The Veryfi Lens camera has been closed, either as a result of submitting an image for processing, or the user closed the camera without submitting an image.
/// @author Veryfi
- (void)veryfiLensClose:(NSDictionary<NSString *, id> * _Nonnull)json;
/// If an error occurs during uploading or processing a submitted or a general exception or crash is caught in Veryfi Lens, this notification contains the error details.
/// @author Veryfi
- (void)veryfiLensError:(NSDictionary<NSString *, id> * _Nonnull)json;
/// This delegate fires once a document has finished processing, whether it was submitted via the camera, the gallery, or it was dictated or entered/typed manually. This delegate provides the response from the Veryfi API.
/// @author Veryfi
- (void)veryfiLensSuccess:(NSDictionary<NSString *, id> * _Nonnull)json;
/// During the processing of a document, this delegate will be fired multiple times. One time it will contain the thumbnail path for the submitted document and one time it will contain a full-size image path. In addition, multiple instances of this delegate will be fired containing the current upload progress percentage
/// @author Veryfi
- (void)veryfiLensUpdate:(NSDictionary<NSString *, id> * _Nonnull)json;
@end


SWIFT_CLASS_NAMED("VeryfiLensSettings")
@interface VeryfiLensSettings : NSObject <NSSecureCoding>
@property (nonatomic) BOOL autoDocDetectionAndCropIsOn;
@property (nonatomic) BOOL autoDeleteAfterProcessing;
@property (nonatomic) BOOL autoLightDetectionIsOn;
@property (nonatomic) BOOL autoCaptureIsOn;
@property (nonatomic) BOOL autoRotateIsOn;
@property (nonatomic) BOOL autoSkewCorrectionIsOn;
@property (nonatomic) BOOL autoCropGalleryIsOn;
@property (nonatomic) BOOL autoSubmitDocumentOnCapture;
@property (nonatomic) BOOL backupDocsToGallery;
@property (nonatomic) BOOL barcodeExtractionIsOn;
@property (nonatomic) BOOL blurDetectionIsOn;
@property (nonatomic) BOOL boostModeIsOn;
@property (nonatomic) BOOL boundingBoxesIsOn;
@property (nonatomic, strong) UIImage * _Nullable brandImage;
@property (nonatomic) BOOL browseIsOn;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull categories;
@property (nonatomic) BOOL checksBackIsOn;
@property (nonatomic) BOOL closeCameraOnSubmit;
@property (nonatomic) BOOL confidenceDetailsIsOn;
@property (nonatomic) enum DataExtractionEngine dataExtractionEngine;
@property (nonatomic) BOOL detectBlurResponseIsOn;
@property (nonatomic) BOOL dictateIsOn;
@property (nonatomic) BOOL allowSubmitUndetectedDocsIsOn;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull documentTypes;
@property (nonatomic, strong) UIColor * _Nullable docDetectFillUIColor;
@property (nonatomic, strong) UIColor * _Nullable docDetectStrokeUIColor;
@property (nonatomic) BOOL emailCCIsOn;
@property (nonatomic, copy) NSString * _Nonnull emailCCDomain;
@property (nonatomic, copy) NSString * _Nullable externalId;
@property (nonatomic) BOOL galleryIsOn;
@property (nonatomic) BOOL gpuIsOn;
@property (nonatomic) BOOL isReimbursableDefault;
@property (nonatomic) BOOL isProduction;
@property (nonatomic) BOOL locationServicesIsOn;
@property (nonatomic) BOOL manualCropIsOn;
@property (nonatomic) BOOL moreMenuIsOn;
@property (nonatomic) BOOL moreSettingsMenuIsOn;
@property (nonatomic) BOOL multipleDocumentsIsOn;
@property (nonatomic) double originalImageMaxSizeInMB;
@property (nonatomic) BOOL parseAddressIsOn;
@property (nonatomic) BOOL rotateDocIsOn;
@property (nonatomic) BOOL returnStitchedPDF;
@property (nonatomic) BOOL saveLogIsOn;
@property (nonatomic) BOOL shareLogsIsOn;
@property (nonatomic) BOOL stitchIsOn;
@property (nonatomic) BOOL showDocumentTypes;
@property (nonatomic) BOOL shieldProtectionIsOn;
@property (nonatomic) double stitchedPDFPixelDensityMultiplier;
@property (nonatomic, copy) NSString * _Nonnull submitButtonBackgroundColor;
@property (nonatomic, copy) NSString * _Nonnull submitButtonBorderColor;
@property (nonatomic) NSInteger submitButtonCornerRadius;
@property (nonatomic, copy) NSString * _Nonnull submitButtonFontColor;
@property (nonatomic, copy) NSArray<VeryfiLensCostCode *> * _Nullable costCodes;
@property (nonatomic, copy) NSArray<VeryfiLensCPModel *> * _Nullable customers;
@property (nonatomic, copy) NSArray<VeryfiLensTag *> * _Nullable tags;
@property (nonatomic, copy) NSArray<VeryfiLensCategory *> * _Nullable categoriesList;
@property (nonatomic, copy) NSString * _Nullable categoryName;
@property (nonatomic, copy) NSString * _Nullable tagName;
- (NSString * _Nonnull)stringFrom:(enum DataExtractionEngine)dataExtractionEngine SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull json;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWith:(NSDictionary<NSString *, id> * _Nullable)dictionary OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
@end



SWIFT_CLASS_NAMED("VeryfiLensTag")
@interface VeryfiLensTag : NSObject <NSSecureCoding>
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) BOOL supportsSecureCoding;)
+ (BOOL)supportsSecureCoding SWIFT_WARN_UNUSED_RESULT;
+ (void)setSupportsSecureCoding:(BOOL)value;
@property (nonatomic, strong) NSNumber * _Nonnull tagId;
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic, strong) VeryfiLensCurrency * _Nonnull currency;
@property (nonatomic) double spent;
@property (nonatomic) NSInteger receiptsCount;
@property (nonatomic, copy) NSString * _Nonnull status;
@property (nonatomic, copy) NSString * _Nonnull type;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithDictionary:(NSDictionary<NSString *, id> * _Nullable)dictionary OBJC_DESIGNATED_INITIALIZER;
- (void)encodeWithCoder:(NSCoder * _Nonnull)coder;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)coder OBJC_DESIGNATED_INITIALIZER;
- (NSString * _Nonnull)getFormattedTotalWithCurrency SWIFT_WARN_UNUSED_RESULT;
- (BOOL)wasSourcedExternally SWIFT_WARN_UNUSED_RESULT;
@end

@class NSData;

/// VeryfiLensUtils provides the image processing and data extraction functionality available in Lens SDK that can be used in your custom UI.
/// @author Veryfi
SWIFT_CLASS_NAMED("VeryfiLensUtils")
@interface VeryfiLensUtils : NSObject
/// Initialize VeryfiLensUtils with credentials a2nd settings (Don’t use VeryfiLensUtils as a separate instance. All the functionality below should be called via VeryfiLens.share().utils)
/// @author Veryfi
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithCredentials:(VeryfiLensCredentials * _Nonnull)credentials settings:(VeryfiLensSettings * _Nonnull)settings completion:(void (^ _Nullable)(BOOL))completion OBJC_DESIGNATED_INITIALIZER;
- (void)updateWithSettings:(VeryfiLensSettings * _Nonnull)settings;
/// Get package identifiers from the upload queue
/// @author Veryfi
- (NSArray<NSString *> * _Nonnull)packagesInQueue SWIFT_WARN_UNUSED_RESULT;
/// Retry uploading all packages currently in queue
/// @author Veryfi
- (void)retryAllPackages;
/// Retry uploading specific package
/// @author Veryfi
- (void)retryPackageWithID:(NSString * _Nonnull)packageID;
/// Remove all packages from the queue
/// @author Veryfi
- (void)discardAllPackages;
/// Remove specific package from the queue
/// @author Veryfi
- (void)discardPackageWith:(NSString * _Nonnull)packageID;
/// Retrieve the original image from a package.
/// @author Veryfi
/// @param packageId n image in the set
/// @param index is used to retrieve image for a specific submitted document
- (NSArray<UIImage *> * _Nonnull)getImagesFrom:(NSString * _Nonnull)packageID SWIFT_WARN_UNUSED_RESULT;
/// Get package data inc thumbnail reference
/// @author Veryfi
/// @param packageId n image in the set
/// @param index is used to retrieve metaData for a specific submitted document
/// @return NSMutableDictionary JSON describing document
- (NSArray<NSDictionary *> * _Nonnull)getMetaDataFrom:(NSString * _Nonnull)packageID SWIFT_WARN_UNUSED_RESULT;
/// Retrieve the original PDF from a package.
/// @author Veryfi
/// @param packageId for the imported PDF
- (NSURL * _Nullable)getPdfURLFrom:(NSString * _Nonnull)packageID SWIFT_WARN_UNUSED_RESULT;
/// Encode NSData to Sctring
/// @author Veryfi
/// @param data data to be encoded
/// @return String encoded base64 string
- (NSString * _Nonnull)base64For:(NSData * _Nonnull)data SWIFT_WARN_UNUSED_RESULT;
/// SDK Version
/// @author Veryfi
/// @return String version in format “X.Y”
@property (nonatomic, readonly, copy) NSString * _Nonnull version;
@end


#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif
