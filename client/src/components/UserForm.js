import { useState, useEffect } from "react";

function UserForm({ addUser, editingUser, updateUser }) {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");

  useEffect(() => {
    if (editingUser) {
      setName(editingUser.name);
      setEmail(editingUser.email);
      setPassword(""); // şifreyi boş bırak
    }
  }, [editingUser]);

  const handleSubmit = (e) => {
    e.preventDefault();
    const userData = { name, email };
    if (!editingUser) userData.password = password;

    if (editingUser) {
      updateUser(editingUser.id, userData);
    } else {
      addUser(userData);
    }

    setName(""); setEmail(""); setPassword("");
  };

  return (
    <form onSubmit={handleSubmit} style={{ marginBottom: "1rem" }}>
      <input placeholder="Name" value={name} onChange={(e) => setName(e.target.value)} required />
      <input placeholder="Email" value={email} onChange={(e) => setEmail(e.target.value)} required />
      {!editingUser && <input type="password" placeholder="Password" value={password} onChange={(e) => setPassword(e.target.value)} required />}
      <button type="submit">{editingUser ? "Update" : "Add"} User</button>
    </form>
  );
}

export default UserForm;
