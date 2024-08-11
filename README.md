# TheToDo Smart Contract

## Overview

The `TheToDo` smart contract is a simple to-do list manager built on the Flow blockchain using Cadence. It allows users to create and manage their own to-do lists. Each user can create multiple to-do items, mark them as done, and retrieve their lists.

## Contract Structure

### 1. **Struct: `List`**

- **`id: UInt32`**: A unique identifier for each to-do item.
- **`title: String`**: The title or description of the to-do item.
- **`is_done: Bool`**: A flag indicating whether the to-do item is completed.

The `List` struct is publicly accessible and has `pub(set)` access modifiers, allowing fields to be modified within the contract.

### 2. **Variable: `lists`**

- **Type**: `{Address: {UInt32: List}}`
- **Description**: A mapping that stores to-do lists for each user. The keys are user addresses, and the values are mappings of list IDs to `List` structs.

### 3. **Initializer**

- **`init()`**: Initializes the `lists` variable as an empty dictionary.

## Functions

### 1. **`createList(owner: Address, title: String)`**

- **Description**: Creates a new to-do list item for the specified `owner` with the given `title`.
- **Parameters**:
  - `owner`: The address of the user creating the list.
  - `title`: The title of the new to-do item.
- **Behavior**:
  - Retrieves the existing to-do lists for the user or initializes a new one.
  - Generates a new ID based on the number of existing items.
  - Adds the new `List` to the user's list.

### 2. **`markListDone(owner: Address, id: UInt32)`**

- **Description**: Marks a specific to-do item as completed for the specified `owner`.
- **Parameters**:
  - `owner`: The address of the user who owns the list.
  - `id`: The ID of the to-do item to be marked as done.
- **Behavior**:
  - Retrieves the user's to-do list.
  - Marks the specified item as completed.

### 3. **`getListItem(owner: Address, id: UInt32): List?`**

- **Description**: Retrieves a specific to-do item from the user's list by its ID.
- **Parameters**:
  - `owner`: The address of the user who owns the list.
  - `id`: The ID of the to-do item to be retrieved.
- **Returns**: The `List` item if found, or `nil` if not.

### 4. **`getList(owner: Address): {UInt32: List}?`**

- **Description**: Retrieves all to-do items for the specified `owner`.
- **Parameters**:
  - `owner`: The address of the user whose list is to be retrieved.
- **Returns**: A dictionary of all `List` items for the user, or `nil` if no lists exist.

## Usage Example

```cadence
import TheToDo from 0x01

// Create a new to-do item
TheToDo.createList(owner: 0x01, title: "Finish Cadence tutorial")

// Mark the to-do item as done
TheToDo.markListDone(owner: 0x01, id: 1)

// Retrieve a specific to-do item
let item = TheToDo.getListItem(owner: 0x01, id: 1)

// Retrieve all to-do items for a user
let allItems = TheToDo.getList(owner: 0x01)
```
