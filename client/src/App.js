import { useState, useEffect } from "react";
import UserList from "./components/UserList";
import UserForm from "./components/UserForm";

function App() {
  const [users, setUsers] = useState([]);
  const [editingUser, setEditingUser] = useState(null);

  const fetchUsers = () => {
    fetch("http://localhost:3000/api/users")
      .then((res) => res.json())
      .then((data) => setUsers(data.users))
      .catch(console.error);
  };

  useEffect(() => {
    fetchUsers();
  }, []);

  const addUser = (user) => {
    fetch("http://localhost:3000/api/users", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ user }),
    })
      .then((res) => res.json())
      .then(() => fetchUsers());
  };

  const updateUser = (id, updatedUser) => {
    fetch(`http://localhost:3000/api/users/${id}`, {
      method: "PUT",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ user: updatedUser }),
    })
      .then((res) => res.json())
      .then(() => fetchUsers());
  };

  const deleteUser = (id) => {
    fetch(`http://localhost:3000/api/users/${id}`, {
      method: "DELETE",
    }).then(() => fetchUsers());
  };

  return (
    <div style={{ padding: "2rem" }}>
      <h1>User Management</h1>
      <UserForm addUser={addUser} editingUser={editingUser} updateUser={updateUser} />
      <UserList
        users={users}
        setEditingUser={setEditingUser}
        deleteUser={deleteUser}
      />
    </div>
  );
}

export default App;
