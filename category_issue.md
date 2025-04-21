# Category Creation Dialog Adds to Firebase but Doesn’t Close or Refresh UI on Second Attempt

## Bug Summary  
When using the `getCategoryCreation()` dialog:
- On the first attempt, everything works as expected:
  - Dialog closes  
  - Firebase updates  
  - UI refreshes with the new category  
- On the second or third attempts:
  - Firebase still updates  
  - Dialog does not close  
  - New category does not appear in the UI

## Expected Behavior  
Each time a category is created, the dialog should close and the UI should refresh with the updated list of categories.

## Current Behavior  
- The new category is successfully created and added to Firebase.
- However, the dialog does not close.
- The updated category list is not fetched or reflected in the UI.

## Possible Cause  
This appears to be a `BuildContext` scoping issue:
- The dialog is using `context.read<GetCategoryBloc>()`, but that context may not have access to the `BlocProvider<GetCategoryBloc>`.
- After the first `Navigator.pop(...)`, any subsequent call to the dialog loses access to the correct bloc context.

## Logs
```
Error: Could not find the correct Provider<GetCategoryBloc> above this BlocListener<CreateCategoryBloc, CreateCategoryState>
```

## Steps to Reproduce
1. Open the `AddExpense` screen
2. Tap the plus (+) button to open the category creation dialog
3. Create and save a category (works fine)
4. Tap the plus (+) button again
5. Create and save another category
6. Observe that the dialog doesn’t close and the UI doesn’t update

## Temporary Workaround  
- Manually restart the app or refresh the UI to see the new categories.

## Suggested Fix  
- Pass the parent `BuildContext` into the dialog function:
  ```dart
  final newCategory = await getCategoryCreation(context);
  ```
- In the dialog:
  - Avoid shadowing by using a different name for the inner dialog `context` (e.g., `dialogContext`)
  - Use `parentContext.read<GetCategoryBloc>().add(GetCategories())` in the `BlocListener`

## Environment  
- Flutter SDK: [insert version]
- Device: Android Emulator (`sdk gphone64 arm64`)
- Dependencies:
  - `flutter_bloc`
  - `firebase_core`
  - `cloud_firestore`
