function UserItem({ user, setEditingUser, deleteUser }) {
  return (
    <li>
      {user.name} ({user.email})
      <button onClick={() => setEditingUser(user)}>Edit</button>
      <button onClick={() => deleteUser(user.id)}>Delete</button>
    </li>
  );
}

export default UserItem;
