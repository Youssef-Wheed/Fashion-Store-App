# Implementation Plan - Persistent Shrinking Bottom Sheet

This plan outlines the changes to `product_details.dart` to implement a persistent `DraggableScrollableSheet` where the product image shrinks as the sheet is expanded.

## User Review Required

> [!IMPORTANT]
> The implementation will use `DraggableScrollableController` which requires Flutter 3.0+.
> I will use standard Material Icons for "Delivery" and "Return" as specific SVGs for these are not present in the `assets/svgs/` folder.

## Proposed Changes

### [Pages]

#### [MODIFY] [product_details.dart](file:///D:/Flutter_Learning/My%20Project/fashion_store_app/lib/Pages/product_details.dart)
- Replace `showModalBottomSheet` logic with a persistent `DraggableScrollableSheet`.
- Use a `Stack` to overlay the sheet on top of the product image.
- Implement `DraggableScrollableController` to track the sheet's expansion.
- Wrap the product image in a `Transform.scale` (or `AnimatedBuilder`) to shrink it based on the sheet's extent.
- Build the scrollable content inside the sheet:
    - Title, Price, and Favorite icon.
    - Dropdowns for Size and Colour selection.
    - Full-width "ADD TO BAG" button.
    - Delivery and Return information rows.
    - Expandable sections using `ExpansionTile` for "About product", etc.
    - "You might also like" horizontal list using data from `product_data.dart`.

### [Widgets]

#### [NEW] [expanding_details_content.dart](file:///D:/Flutter_Learning/My%20Project/fashion_store_app/lib/Widgets/expanding_details_content.dart) (Optional, or keep as private widget in `product_details.dart`)
- I'll keep the internal widgets private within `product_details.dart` first to minimize file changes, as requested.

## Verification Plan

### Manual Verification
- Navigate from `Categories` to `ProductDetails` to ensure data (name, price, image) is passed correctly.
- Drag the bottom sheet up and verify that the product image shrinks smoothly.
- Verify that the bottom sheet is persistent and cannot be dismissed.
- Test the "You might also like" horizontal scroll.
- Check the `ExpansionTile` sections for correct behavior.
