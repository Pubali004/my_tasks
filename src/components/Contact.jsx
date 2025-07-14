import React from 'react';

function Contact() {
  
  const contacts = [
   
    {
      id: 1,
      name: 'Veer Singh',
      phone: '8974561235',
      email: 'veer9sin56@gmail.com',
      
    
    },
    {
      id: 2,
      name: 'Dev Malhotra',
      phone: '9877789851',
      email: 'malhotradev69@gmail.com',
      
    },
    {
      id: 3,
      name: 'Bobby Mondal',
      phone: '95581230456',
      email: 'bobbyMondal@example.com',
      
    },
    {
      id: 4,
      name: 'Alice Brown',
      phone: '80112348567',
      email: 'alice.brown@gmail.com',
      
    },
   
    
  ];

  return (
    <div className="app">
      <h1>Contacts</h1>
      <div className="card-container">
        {contacts.map(contact => (
          <div key={contact.id} className="card">
            <h2>{contact.name}</h2>
            <p>Phone: {contact.phone}</p>
            <p>Email: <a href={`mailto:${contact.email}`}>{contact.email}</a></p>
            <p>Address: {contact.address}</p>
          </div>
        ))}
      </div>
    </div>
  );
}

export default Contact;
